package com.squareup.wire

import com.squareup.wire.internal.RealGrpcInterceptorChain
import okhttp3.internal.http.RealInterceptorChain

class CallServerGrpcInterceptor:GrpcInterceptor {
  override fun <S : Any, R : Any> intercept(chain: GrpcInterceptor.Chain<S, R>): R {
    val realChain = chain as RealGrpcInterceptorChain
    val request = realChain.request


  }
}
