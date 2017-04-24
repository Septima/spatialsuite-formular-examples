## Drikkevandskvalitet

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med drikkevandskvalitet

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-drikkevandskvalitet" dir="custom/formular-config/drikkevandskvalitet" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-drikkevandskvalitet.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=drikkevandskvalitet
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS




