.PHONY: all clean submission
.PRECIOUS: spaceness.bbl spaceness.aux

all: spaceness.pdf

# get these by doing
#   echo $(grep includegr spaceness.tex | sed -e 's/.*{\([^}]*\)}.*/\1/')
FIGURES = figures/sampling_maps.pdf figures/pop_params.pdf figures/sfs_w_sumstats.pdf figures/stairwayplot_facet_rollmean.pdf figures/gwas_summary.pdf figures/sumstats_by_neighbors_allstats.pdf figures/fig_S1_sfs_grid_model_by_sampling.pdf figures/het_z_by_ind.pdf 

PDFLATEX = pdflatex -interaction=nonstopmode

spaceness.pdf : spaceness.bib second-review-responses.tex $(FIGURES)

clean: 
	-rm *.aux *.log *.lof *.lot *.fff *.ttt *.out *.bbl *.blg

%.pdf : %.tex %.bbl
	while ( $(PDFLATEX) $<;  grep -q "Rerun to get" $*.log ) do true ; done

%.aux : %.tex
	-$(PDFLATEX) $<

%.bbl : %.aux
	-bibtex $<

%.svg : %.pdf
	inkscape $< --export-plain-svg=$@

%.png : %.pdf
	convert -density 300 $< -flatten $@

%.pdf : %.ink.svg
	inkscape $< --export-pdf=$@

%.eps : %.pdf
	inkscape --without-gui --export-eps=$@ $<

%.fonts.pdf : %.pdf
	# this will embed all fonts
	inkscape $< --export-pdf=$@

spaceness_diff_to_first_submission.tex : spaceness.tex
	latexdiff-git -r 7ea9d412bf87d3625882020ff4a859438483366e spaceness.tex
	mv spaceness-diff7ea9d412bf87d3625882020ff4a859438483366e.tex $@

spaceness_diff_to_second_submission.tex : spaceness.tex
	latexdiff-git -r a12495e239a6d26736cb5f0f5b16d62c1aa3dfcb spaceness.tex
	mv spaceness-diffa12495e239a6d26736cb5f0f5b16d62c1aa3dfcb.tex $@

