/*
 * Copyright (C) 2023 Square, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.squareup.wire.kotlin.grpcserver

import com.squareup.kotlinpoet.FileSpec
import com.squareup.wire.WireCompiler
import java.io.File
import okio.buffer
import okio.source
import org.assertj.core.api.Assertions

object GoldenTestUtils {
  fun assertFileEquals(expectedFileName: String, spec: FileSpec) {
    val finalSpec = spec.toBuilder()
      .addFileComment(WireCompiler.CODE_GENERATED_BY_WIRE)
      .build()

    val expected = File("src/test/golden/$expectedFileName").source().buffer().readUtf8()

    Assertions.assertThat(finalSpec.toString()).isEqualTo(expected)
  }
}