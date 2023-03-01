// RUN: diff <(stablehlo-opt %s --stablehlo-legalize-to-vhlo --vhlo-to-version=target=current -emit-bytecode | stablehlo-opt --vhlo-legalize-to-stablehlo) <(stablehlo-opt %s)

module @jit_fun_flat_jax {
  func.func public @main(%arg0: tensor<i64>, %arg1: tensor<?x3x4xf32> {mhlo.sharding = ""}, %arg2: tensor<?x3x4xf32> {mhlo.sharding = ""}) -> tensor<?x3x4xcomplex<f32>> {
    %0 = stablehlo.complex %arg1, %arg2 : tensor<?x3x4xcomplex<f32>>
    return %0 : tensor<?x3x4xcomplex<f32>>
  }
}
