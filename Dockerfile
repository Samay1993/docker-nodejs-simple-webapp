# Specify a base image
FROM node:alpine 
#alpine in the docker world means any image with bare minimum things in it, like in this case this node image will have minimum dependencies inside of it to make it run
#most of the image in docker hub will have an alpine version not containing any kind of middlewares.

WORKDIR /usr/app
#This instruction makes sure all the file will get copied to /usr/app folder in the container's file system and it wil make this folder as the working directory

# Install some depenendencies
COPY ./package.json ./ 
# Above instruction will copy package.json from host system to container working directory, so that if we make changes to the code at any point of time it will not
# download the dependencies again, unless we make changes in package.json file.

RUN npm install
# Above instruction is going to download the dependencied from package.json file

COPY ./ ./
# Above instruction will copy all the files from host system to container working directory.


# Default command
CMD ["npm", "start"]
# Above instruction will make the container set the start up command.