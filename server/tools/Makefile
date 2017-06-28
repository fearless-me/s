all:
	gs

allD:
	gsD

gs:
	cd ../gameserver && $(MAKE) -j8
	
gsD:
	cd ../gameserver && $(MAKE) CONFIG=DEBUG -j8

clean:
	cd ../gameserver && $(MAKE) clean

