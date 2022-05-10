FROM rocker/r-ver:4.1.3
RUN /rocker_scripts/install_texlive.sh
RUN apt-get -y install inkscape fonts-roboto curl git rsync
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"
RUN tlmgr install beamer listings amsmath hyperref adjustbox svg infwarerr kvoptions collectbox hyphenat fontspec koma-script trimspaces transparent extsizes
RUN /rocker_scripts/install_julia.sh 1.7.2
COPY ["Manifest.toml", "Project.toml", "./"]
RUN julia --project -e 'using Pkg; Pkg.instantiate()'
RUN julia --project -e 'using Pkg; Pkg.status()'
RUN julia --project -e 'println(Base.active_project())'
