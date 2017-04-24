## Erklæring om teknisk dokumentation

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Erklæring om teknisk dokumentation

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-erklaering_teknisk_doku" dir="custom/formular-config/erklaering_teknisk_doku" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-erklaering_teknisk_doku.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=erklaering_teknisk_doku
```

#### Bemærk
Dette modul benytter mailservice fra Septima




