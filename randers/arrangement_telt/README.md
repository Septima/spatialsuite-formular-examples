## Ansøgning om afvikling af arrangementer for mere en 150 i telt

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Ansøgning om afvikling af arrangementer for mere en 150 i telt

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-arrangement_telt" dir="custom/formular-config/arrangement_telt" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-arrangement_telt.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=arrangement_telt
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS mailservice fra Septima




