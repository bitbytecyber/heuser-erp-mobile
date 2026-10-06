import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Firebase plugins are applied only when a google-services.json exists for at
// least one flavor, so a fresh clone (or a CI job without Firebase configured
// yet) still builds. Add the files with `flutterfire configure` per flavor —
// see RELEASE.md "Firebase per flavor".
val hasGoogleServices = listOf("", "src/dev/", "src/staging/", "src/prod/")
    .any { file("${it}google-services.json").exists() }
if (hasGoogleServices) {
    apply(plugin = "com.google.gms.google-services")
    apply(plugin = "com.google.firebase.crashlytics")
}

// key.properties and the keystore are gitignored. Without this guard a release
// build on a fresh clone silently falls back to the debug key and produces an
// artefact the Play Store rejects. Checked on the task graph so debug builds
// keep working without a keystore.
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) load(FileInputStream(keystorePropertiesFile))
}
gradle.taskGraph.whenReady {
    val buildingRelease = allTasks.any { it.name.contains("Release", ignoreCase = true) }
    if (buildingRelease && !keystorePropertiesFile.exists()) {
        throw GradleException(
            "android/key.properties is missing — refusing to sign a release build with the " +
                "debug key. Restore key.properties and the upload keystore (RELEASE.md), or " +
                "build a debug variant instead."
        )
    }
}

android {
    namespace = "com.heusercollege.erp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.heusercollege.erp"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Overridden by --build-name / --build-number in CI (RELEASE.md).
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // One flavor per backend. The launcher label comes from the flavor so the
    // three builds can be installed side by side and told apart.
    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "Heuser Dev")
        }
        create("staging") {
            dimension = "env"
            applicationIdSuffix = ".staging"
            versionNameSuffix = "-staging"
            resValue("string", "app_name", "Heuser Staging")
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "Heuser")
        }
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = rootProject.file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            // Native shrinking; Dart obfuscation is `--obfuscate --split-debug-info`
            // on the shorebird/flutter command line (codemagic.yaml).
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
