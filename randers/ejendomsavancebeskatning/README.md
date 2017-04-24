## Ejendomavancebeskatning

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Ejendomavancebeskatning

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-ejendomsavancebeskatning" dir="custom/formular-config/ejendomsavancebeskatning" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-ejendomsavancebeskatning.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=ejendomsavancebeskatning
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS og mailservice fra Septima




