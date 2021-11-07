import os
for root, dirs, files in os.walk(".", topdown=False):
   for name in files:
      filename, file_extension = os.path.splitext(os.path.join(root, name))
      print(file_extension)
      if file_extension == ".m4a":
          print(f"Converting... ffmpeg -i {filename + file_extension} -vn {filename}.wav")
          os.system(f"ffmpeg -i \"{filename + file_extension}\" -vn \"{filename}Session2.wav\"")
