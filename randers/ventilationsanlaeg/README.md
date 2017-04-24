## Ventilationsanlæg

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med tilsyn af ventilationsanlæg

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-ventilationsanlaeg" dir="custom/formular-config/ventilationsanlaeg" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-ventilationsanlaeg.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=ventilationsanlaeg
```





