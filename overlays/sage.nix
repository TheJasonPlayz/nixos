(final: prev: {
  sage = (prev.sage.overrideAttrs (prevAttrs: 
  let
    sage-env = prev.sage.with-env.outPath + "/bin/sage-env";
  in
  {
    installPhase = prevAttrs.installPhase + ''
      source ${sage-env}
      sudo jupyter kernelspec $SAGE_SHARE/jupyter/kernels/sagemath    
    '';
  }));
})