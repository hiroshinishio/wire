// Code generated by Wire protocol buffer compiler, do not edit.
// Source: squareup.proto3.BuyOneGetOnePromotion in pizza.proto
package squareup.proto3

import com.squareup.wire.FieldEncoding
import com.squareup.wire.Message
import com.squareup.wire.ProtoAdapter
import com.squareup.wire.ProtoReader
import com.squareup.wire.ProtoWriter
import com.squareup.wire.Syntax.PROTO_3
import com.squareup.wire.WireField
import com.squareup.wire.`internal`.sanitize
import kotlin.Any
import kotlin.Boolean
import kotlin.Int
import kotlin.Long
import kotlin.String
import kotlin.Unit
import kotlin.jvm.JvmField
import okio.ByteString

public class BuyOneGetOnePromotion(
  @field:WireField(
    tag = 1,
    adapter = "com.squareup.wire.ProtoAdapter#STRING",
    label = WireField.Label.OMIT_IDENTITY
  )
  @JvmField
  public val coupon: String = "",
  unknownFields: ByteString = ByteString.EMPTY
) : Message<BuyOneGetOnePromotion, BuyOneGetOnePromotion.Builder>(ADAPTER, unknownFields) {
  public override fun newBuilder(): Builder {
    val builder = Builder()
    builder.coupon = coupon
    builder.addUnknownFields(unknownFields)
    return builder
  }

  public override fun equals(other: Any?): Boolean {
    if (other === this) return true
    if (other !is BuyOneGetOnePromotion) return false
    if (unknownFields != other.unknownFields) return false
    if (coupon != other.coupon) return false
    return true
  }

  public override fun hashCode(): Int {
    var result = super.hashCode
    if (result == 0) {
      result = unknownFields.hashCode()
      result = result * 37 + (coupon?.hashCode() ?: 0)
      super.hashCode = result
    }
    return result
  }

  public override fun toString(): String {
    val result = mutableListOf<String>()
    result += """coupon=${sanitize(coupon)}"""
    return result.joinToString(prefix = "BuyOneGetOnePromotion{", separator = ", ", postfix = "}")
  }

  public fun copy(coupon: String = this.coupon, unknownFields: ByteString = this.unknownFields):
      BuyOneGetOnePromotion = BuyOneGetOnePromotion(coupon, unknownFields)

  public class Builder : Message.Builder<BuyOneGetOnePromotion, Builder>() {
    @JvmField
    public var coupon: String = ""

    public fun coupon(coupon: String): Builder {
      this.coupon = coupon
      return this
    }

    public override fun build(): BuyOneGetOnePromotion = BuyOneGetOnePromotion(
      coupon = coupon,
      unknownFields = buildUnknownFields()
    )
  }

  public companion object {
    @JvmField
    public val ADAPTER: ProtoAdapter<BuyOneGetOnePromotion> = object :
        ProtoAdapter<BuyOneGetOnePromotion>(
      FieldEncoding.LENGTH_DELIMITED, 
      BuyOneGetOnePromotion::class, 
      "type.googleapis.com/squareup.proto3.BuyOneGetOnePromotion", 
      PROTO_3, 
      null
    ) {
      public override fun encodedSize(`value`: BuyOneGetOnePromotion): Int {
        var size = value.unknownFields.size
        if (value.coupon != "") size += ProtoAdapter.STRING.encodedSizeWithTag(1, value.coupon)
        return size
      }

      public override fun encode(writer: ProtoWriter, `value`: BuyOneGetOnePromotion): Unit {
        if (value.coupon != "") ProtoAdapter.STRING.encodeWithTag(writer, 1, value.coupon)
        writer.writeBytes(value.unknownFields)
      }

      public override fun decode(reader: ProtoReader): BuyOneGetOnePromotion {
        var coupon: String = ""
        val unknownFields = reader.forEachTag { tag ->
          when (tag) {
            1 -> coupon = ProtoAdapter.STRING.decode(reader)
            else -> reader.readUnknownField(tag)
          }
        }
        return BuyOneGetOnePromotion(
          coupon = coupon,
          unknownFields = unknownFields
        )
      }

      public override fun redact(`value`: BuyOneGetOnePromotion): BuyOneGetOnePromotion =
          value.copy(
        unknownFields = ByteString.EMPTY
      )
    }

    private const val serialVersionUID: Long = 0L
  }
}
