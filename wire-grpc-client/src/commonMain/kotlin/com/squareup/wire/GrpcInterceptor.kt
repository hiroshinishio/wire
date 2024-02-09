package com.squareup.wire

import okio.IOException

interface GrpcInterceptor {

  @Throws(IOException::class)
  fun <S : Any, R : Any> intercept(chain: Chain<S, R>): R

  interface Chain<S : Any, R : Any> {
    val request: S

    @Throws(IOException::class)
    fun proceed(request: S): R
  }
}
