setLog -file "build/impact.log"
setMode -bs
setCable -port auto
loadProjectFile -file "boards/numato-mimas-v2.cdf"
Program -e -p 1
quit
