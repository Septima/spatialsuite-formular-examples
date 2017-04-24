## Tilsyn FBB

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med tilsyn af FBB

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-tilsyn-fbb" dir="custom/formular-config/tilsyn_fbb" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-tilsyn-fbb.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=tilsyn_fbb
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS




