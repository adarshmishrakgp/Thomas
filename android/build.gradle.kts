import java.io.File

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Set build directory to handle paths with spaces properly
// Use File constructor which handles spaces in paths correctly
val projectRootDir = rootProject.projectDir.parentFile
val newBuildDir = File(projectRootDir, "build")
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = File(newBuildDir, project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}

// Ensure all file operations handle paths with spaces correctly
allprojects {
    tasks.configureEach {
        // Use File objects for all path operations to handle spaces
        doFirst {
            val buildDir = project.layout.buildDirectory.get().asFile
            if (!buildDir.exists()) {
                buildDir.mkdirs()
            }
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
