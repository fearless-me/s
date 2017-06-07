all:	dbs	ls	cs	gs

allD:	dbsD	lsD	csD	gsD

dbs:
	cd dbserver && $(MAKE) -j8

ls:
	cd loginserver && $(MAKE) -j8

cs:
	cd commonserver && $(MAKE) -j8

fs:
	cd funcell && $(MAKE) -j8

gs:
	cd ../gameserver && $(MAKE) -j8

dbsD:
	cd dbserver && $(MAKE) CONFIG=DEBUG -j8

lsD:
	cd loginserver && $(MAKE) CONFIG=DEBUG -j8

csD:
	cd commonserver && $(MAKE) CONFIG=DEBUG -j1

fsD:
	cd funcell && $(MAKE) CONFIG=DEBUG -j8

gsD:
	cd ../gameserver && $(MAKE) CONFIG=DEBUG -j8

clean:	cdbs	cls	ccs	cgs

cdbs:
	cd dbserver && $(MAKE) clean

cls:
	cd loginserver && $(MAKE) clean

ccs:
	cd commonserver && $(MAKE) clean

cfs:
	cd funcell && $(MAKE) clean

cgs:
	cd ../gameserver && $(MAKE) clean

