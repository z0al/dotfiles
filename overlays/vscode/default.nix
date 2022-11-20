channels: final: prev: {
  vscode = channels.unstable.vscode.overrideAttrs (o: {
    postInstall = (o.postInstall or "") + ''
      cat ${./custom.css} >> $out/lib/vscode/resources/app/out/vs/workbench/workbench.desktop.main.css
    '';
  });
}
