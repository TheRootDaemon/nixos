{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bun
    nodejs
    pnpm

    prettier

    svelte-language-server
    tailwindcss-language-server
    typescript-language-server

    vscode-css-languageserver
    vscode-langservers-extracted

    yamlfmt
    yaml-language-server
  ];
}
