//https://console.cloud.google.com/storage/browser/quickdraw_dataset/full/numpy_bitmap

size(280, 280); //size of window

byte[] data = loadBytes("train.npy");
println(data.length); //99446560 bytes

//int total = (data.length - 80) / 784;
//println(total); // 126845
// 80 extra bytes at the beginning

int total = 1000; // 100 images 10x10

byte[] outdata = new byte[total* 784];
int outindex = 0;
for(int n = 0; n < total; n++) {
  int start = 80 + n * 784; 
  //PImage img = createImage(28,28, RGB);
  //img.loadPixels();
  for (int i = 0; i < 784; i++) {
    int index = i + start;
    byte val = data[index];
    outdata[outindex] = val;
    outindex++;
    
    //img.pixels[i] = color(255 - val & 0xff);
    
  }
  //img.updatePixels();
  //int x = 28 * (n % 10);
  //int y = 28 * (n / 10);
  //image(img, x, y);  // draws the image
}

//save as binary file 
saveBytes("trains1000.bin", outdata); // save array of bytes to a  binary file



// -127 - 127 (unsigned bytes) 
// apply a bytewise operation

// accessed the data check!
// seen how the data works!
// NEXT: save it out into a format I can use in js


//save a file with 1000 images in it 
  // save in bytes
  //load in as binary 