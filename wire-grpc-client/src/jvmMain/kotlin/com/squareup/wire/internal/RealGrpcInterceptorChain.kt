package com.squareup.wire.internal

import com.squareup.wire.GrpcInterceptor

class RealGrpcInterceptorChain<S : Any, R : Any>(
  private val interceptors: List<GrpcInterceptor>,
  private val index: Int,
  override val request: S,
) : GrpcInterceptor.Chain<S, R> {

  internal fun <R: Any> copy(
    index: Int = this.index,
    request: S = this.request,
  ) = RealGrpcInterceptorChain<S, R>(
    interceptors,
    index,
    request,
  )

  override fun proceed(request: S): R {
    check(index < interceptors.size)

    // Call the next interceptor in the chain.
    val next = copy<R>(index = index + 1, request = request)
    val interceptor = interceptors[index]

    @Suppress("USELESS_ELVIS")
    val response =
      interceptor.intercept(next) ?: throw NullPointerException(
        "interceptor $interceptor returned null",
      )

    return response
  }
}
