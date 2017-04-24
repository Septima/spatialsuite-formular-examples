## Kommunale lejemål

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Kommunale lejemål

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-lejemaal" dir="custom/formular-config/lejemaal" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-lejemaal.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=lejemaal
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS




