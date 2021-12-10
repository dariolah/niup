all:
	cat niupobj-static.nim > ../src/niup.nim && \
	       	nim r -d:release --gc:orc genniupobj.nim iup-metadata.ods >> ../src/niup.nim && \
		cat niupobj-static-fn.nim >> ../src/niup.nim

