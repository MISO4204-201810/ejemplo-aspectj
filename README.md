# Ejemplo usando AspectJ en un proyecto Maven

Proyecto Maven que utiliza un aspecto para modificar una clase.

## Contenido

Este es un proyecto Maven. Esto quiere decir que se tiene un archivo `pom.xml` que contiene una definición del proyecto.

Además, como proyecto Maven, se tienen carpetas separadas para el código fuente que se debe incluir en los archivos `.jar` y para las pruebas

| Carpeta        | Descripción                |
| :------------- | :------------------------- |
| `src/main/java`  | Clases principales en Java |
| `src/test/java`  | Pruebas en Java            |

El proyecto contiene unas clases y archivos de interés:

| en el `src/main/java`         | Descripción                        |
| :-------------------------------- | :--------------------------------- |
| `ejemplo.aspectos.Cuenta.java`      | Clase cuenta                       |
| `ejemplo.aspectos.AspectoCuenta.aj` | Aspecto que agrega un saldo mínimo |

| en el `src/test/java`         | Descripción                        |
| :-------------------------------- | :--------------------------------- |
| `ejemplo.aspectos.PruebaCuenta.java`      | Prueba del proyecto                     |


## Configuración en el `pom.xml`

En el `pom.xml` se tiene una dependencia a las librerías de AspectJ.

```
	<!-- AspectJ -->	
	<dependency>
	    <groupId>org.aspectj</groupId>
	    <artifactId>aspectjrt</artifactId>
	    <version>1.8.9</version>
	</dependency>	
```

Además, se tiene un plugin que combina los aspectos.

```
	<!-- AspectJ: weave aspects -->
	<plugin>
	    <groupId>org.codehaus.mojo</groupId>
	    <artifactId>aspectj-maven-plugin</artifactId>
	    <version>1.7</version>
	    <configuration>
	        <complianceLevel>1.8</complianceLevel>
	        <source>1.8</source>
	        <target>1.8</target>
	        <showWeaveInfo>true</showWeaveInfo>
	        <verbose>true</verbose>
	        <Xlint>ignore</Xlint>
	        <encoding>UTF-8 </encoding>
	    </configuration>
	    <executions>
	        <execution>
	            <goals>
	                <!-- use this goal to weave all your main classes -->
	                <goal>compile</goal>
	                <!-- use this goal to weave all your test classes -->
	                <goal>test-compile</goal>
	            </goals>
	        </execution>
	    </executions>
	</plugin>
```


## Ejecución

La aplicación solo incluye una prueba. Es posible ejecutar las pruebas desde la línea de comandos usando Maven.

```bash
mvn test
```

Si usa Eclipse, es posible importar el código como un `Proyecto Maven` y ejecutar las pruebas haciendo click-derecho sobre el proyecto y seleccionando `Run As > Maven test`.

