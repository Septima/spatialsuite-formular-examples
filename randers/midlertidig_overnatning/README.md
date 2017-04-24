## Midlertidig overnatning

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med midlertidig overnatning

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-midlertidig_overnatning" dir="custom/formular-config/midlertidig_overnatning" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-midlertidig_overnatning.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=midlertidig_overnatning
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS samt mailservice fra Septima




