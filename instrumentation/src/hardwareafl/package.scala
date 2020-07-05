
import chisel3._

package object hardwareafl {
  // Some magic to help SparseMem generically handle Mems of type Vec and not (for use of mask)
  case class MaybeVec[-T](evidence: Option[T <:< Vec[_]])
  implicit def isVec[T](implicit ev: T <:< Vec[_]): MaybeVec[T] = MaybeVec(Some(ev))
  implicit val notVec: MaybeVec[Any] = MaybeVec(None)
}
