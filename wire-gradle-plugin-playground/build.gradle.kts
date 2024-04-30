plugins {
  id("java-library")
  kotlin("jvm")
  id("com.squareup.wire")
}

wire {

  sourcePath {
    srcDir("src/main/proto")
  }

  kotlin {
    out = "src/main/kotlin"
    emitAppliedOptions = true
    emitDeclaredOptions = true
  }
}

dependencies {
  implementation(projects.wireGrpcClient)
  implementation(libs.okio.core)
  implementation(projects.wireCompiler)
  implementation(projects.wireSchema)
  implementation(projects.wireGsonSupport)
  implementation(projects.wireMoshiAdapter)
  implementation(libs.assertj)
  implementation(libs.junit)
  implementation(libs.protobuf.javaUtil)
  implementation(projects.wireTestUtils)
}
