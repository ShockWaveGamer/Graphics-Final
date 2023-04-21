# Graphics Final
## Daniel Fiuk - 100834886

### Bump Map
![image](https://user-images.githubusercontent.com/88565667/233696131-375254ac-1941-4e42-b127-9b9f4e0c27d5.png)
![image](https://user-images.githubusercontent.com/88565667/233696250-657f6317-cc7b-4297-948b-c23a7375f302.png)

![image](https://user-images.githubusercontent.com/88565667/233695450-a15b2398-46ab-46f7-861a-97b1d2067c46.png)
Our propeties are a main texture, the textures bumpmap, a float for bump intensity, and a color.

Colecting the UVs of the texture and the bump map in the Input.
We then use that in the surf function to set the albedo with the main texture rgb multiplied by the color variable.
And then set the object's normals using the bumpmap and then multiplied with the intensity variable.

NOTE: Unity auto corrected my bumptexture to appear blue and yellow. It still works fine with this change, but my original file was black and white. I used Aseprite to create the brick textures on my own. 
