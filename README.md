# Graphics Final
## Daniel Fiuk - 100834886

### Controls
WASD - Movement
Space - Toggle Bloom

### Bump Map
![image](https://user-images.githubusercontent.com/88565667/233696131-375254ac-1941-4e42-b127-9b9f4e0c27d5.png)
![image](https://user-images.githubusercontent.com/88565667/233696250-657f6317-cc7b-4297-948b-c23a7375f302.png)

![image](https://user-images.githubusercontent.com/88565667/233695450-a15b2398-46ab-46f7-861a-97b1d2067c46.png)
Our propeties are a main texture, the textures bumpmap, a float for bump intensity, and a color.

Colecting the UVs of the texture and the bump map in the Input.
We then use that in the surf function to set the albedo with the main texture rgb multiplied by the color variable.
And then set the object's normals using the bumpmap and then multiplied with the intensity variable.

NOTE: Unity auto corrected my bumptexture to appear blue and yellow. It still works fine with this change, but my original file was black and white. I used Aseprite to create the brick textures on my own. 

### Mud Water, Overlap + Wave Shader
![image](https://user-images.githubusercontent.com/88565667/233702453-25900725-02f4-470c-96bd-9205e2aeee2e.png)
![image](https://user-images.githubusercontent.com/88565667/233702491-6b819c61-dda8-4e63-961b-7ea452cc6c1b.png)

![image](https://user-images.githubusercontent.com/88565667/233702372-00998132-52fb-4fea-b749-f9c981962efb.png)
Assides from initializing the variables...
In the vertex shader I calculate a new vertex position along an objects y axis using a sin function and time. This value is then addded to the individual vertex to offset it inorder to create the wave pattern. 
In the fragment shader I continuously offset the uvs of the main and foam textures in a direction set in the inspector. It then adds both texture's colors together to create the overlapping effect. The foam travels in the same direction as the main texture just twice as fast.

NOTE: I used Aseprite again to create the mud and foam textures on my own. 

### Bloom
![image](https://user-images.githubusercontent.com/88565667/233706390-85b21d4b-43ee-4702-b0b0-d7125765f423.png)

![image](https://user-images.githubusercontent.com/88565667/233706314-322e73c2-6aad-4ef9-872d-6cb55408570a.png)

To achive this effect I used upsampling to blur the image recived by the camera. Each interation takes the image and intrapolates it with itself creadting blured edges. The head of the player character has attached to it a lightsource.

