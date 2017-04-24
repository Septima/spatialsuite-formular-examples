## Ansøgning om afvikling af arrangementer for mere en 150 personer

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Ansøgning om afvikling af arrangementer for mere en 150 personer

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-arrangement150" dir="custom/formular-config/arrangement150" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-arrangement150.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=arrangement150
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS og mailservice fra Septima




