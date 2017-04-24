## Separering af kloak

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Separering af kloak

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-faerdigmeld_separering_kloak" dir="custom/formular-config/faerdigmeld_separering_kloak" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-tilsyn-fbb.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=faerdigmeld_separering_kloak
```

#### Bemærk
Dette modul benytter mailservice fra Septima




