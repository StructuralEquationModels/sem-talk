all: .gitignore presentation.pdf

publish/: presentation.pdf
	mkdir -p $@
	cp presentation.pdf publish/presentation.pdf

.gitignore: .gitignore-manual
	curl -sL https://www.toptal.com/developers/gitignore/api/LaTex,R,Julia,VisualStudioCode > .gitignore
	cat .gitignore-manual >> .gitignore	

presentation.pdf: presentation.tex fonts/ beamerthemeExecushares.sty figures/lorem_ipsum_green.pdf figures/lorem_ipsum_red.pdf figures/julia_logo.pdf figures/users.pdf figures/difficulty.pdf
	xelatex $<

beamerthemeExecushares.sty: latex/beamerthemeExecushares.sty
	cp $< $@

figures/lorem_ipsum_green.pdf: latex/lorem_ipsum_green.tex
	xelatex $<
	mv $(notdir $(basename $<).pdf) $@
	
figures/lorem_ipsum_red.pdf: latex/lorem_ipsum_red.tex
	xelatex $<
	mv $(notdir $(basename $<).pdf) $@

figures/julia_logo.pdf: figures/julia_logo.svg
	inkscape --export-area-page --export-pdf=$@ $<

figures/difficulty.pdf: julia/difficulty.jl
	julia --project $<

figures/users.pdf: julia/users.jl
	julia --project $<

fonts/:
	mkdir -p $@
	curl -sL https://github.com/cormullion/juliamono/releases/download/v0.045/JuliaMono-ttf.tar.gz| tar -zxf - --directory $@
