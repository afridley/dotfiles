```ts
'use server'

// import sharp from 'sharp'
const sharp = require('sharp')

export const changeImage = async (imageData: FormData) => {
  const image = imageData?.get('imageFile') as File | undefined
  
  const buffer = await image?.arrayBuffer()

  if (buffer) {
    const array = new Uint8Array(buffer)
    const test = await sharp(array)
      .jpeg({ quality: 20 }).toBuffer()

    return test
  }
}

```

```ts
'use client'

import { useEffect, useState } from 'react'
import { changeImage } from './action'

const TestImage: React.FC = () => {
  const [selectedImage, setSelectedImage] = useState<any>(null)
  const [anImage, setAnImage] = useState<any>('')
  const [imageUrl, setImageUrl] = useState<string>('')
  useEffect(() => {
    if (selectedImage) {
      setImageUrl(URL.createObjectURL(selectedImage))
    }
  }, [selectedImage])

  const onSubmit = async (e: any) => {
    e.preventDefault()
    const im = document.getElementById('image') as HTMLInputElement
    console.log(im?.files?.[0])

    const imageData = new FormData()

    if (im.files) {
      imageData.append('imageFile', im.files[0])
    }

    const comped = await changeImage(imageData)
    const testAr = new Uint8Array(comped.data)
    const url = URL.createObjectURL(new Blob([testAr.buffer], { type: 'image/jpg' }))
    setAnImage(url)
  }
  console.log(anImage)
  return (
    <div>
      {/* <img alt="a" src={`data:application/jpg;base64,${anImage}`} /> */}
      <img alt="a" src={`${anImage}`} />
      <form onSubmit={onSubmit}>
        {imageUrl ? (
          <img
            className="pds-h-[100px] pds-w-[100px] pds-rounded-circle pds-object-cover"
            src={imageUrl}
            alt={(selectedImage as any).name}
          />
        ) : <div className="pds-h-[100px] pds-w-[100px] pds-rounded-circle pds-border pds-border-surface-line" />}
        <input
          name="image"
          id="image"
          onChange={(e) => setSelectedImage(e.target.files?.[0])}
          type="file"
          accept="image/png, image/jpeg"
        />
        <input type="submit" />
      </form>
    </div>
  )
}

export default TestImage

```