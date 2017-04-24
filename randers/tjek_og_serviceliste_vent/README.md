## Tjek- og serviceliste - Ventilationsanlæg

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Tjek- og serviceliste - Ventilationsanlæg

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-tjek_og_serviceliste_vent" dir="custom/formular-config/tjek_og_serviceliste_vent" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-tjek_og_serviceliste_vent.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=tjek_og_serviceliste_vent
```



