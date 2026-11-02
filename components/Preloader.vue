<script setup lang="ts">
import { animate } from 'motion'
import { easeInOutExpo } from '~/static/easings'

type PreloadImages = string[]

const { data: rawPreloadImages } = await useFetch<PreloadImages>('/api/preload')

const preloadImages = computed<PreloadImages>(
  () => rawPreloadImages.value ?? [],
)

const loaded = useState<boolean>('loaded')

const preloadEl = ref<HTMLElement>()

const preloadPercent = ref<number>(0)
const preloadState = computed<string>(
  () => preloadPercent.value.toFixed() + '%',
)

const percentPerPicture = computed(() => 1 / preloadImages.value.length * 100)

function getPreloadPromises(images: PreloadImages): Promise<void>[] {
  const preloadPromises = images.map((src) => {
    return new Promise<void>((resolve) => {
      const img = new Image()
      img.src = `/images/${src}`

      const imgReady = () => {
        preloadPercent.value += percentPerPicture.value
        resolve()
      }

      img.addEventListener('load', imgReady)
      img.addEventListener('error', imgReady)
    })
  })

  return preloadPromises
}

async function preload() {
  await Promise.allSettled(getPreloadPromises(preloadImages.value))

  if (preloadEl.value) {
    animate(preloadEl.value,
      {
        visibility: 'hidden',
        opacity: [1, 0],
      },
      {
        duration: 0.5,
        easing: easeInOutExpo,
      },
    )
  }

  loaded.value = true
}

onMounted(preload)
</script>

<template>
  <div
    ref="preloadEl"
    class="preloader"
  >
    <p>{{ preloadState }}</p>
  </div>
</template>

<style scoped lang="scss">
.preloader {
  z-index: 99;
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100%;
  background: var(--black);
  display: flex;
  justify-content: center;
  align-items: center;

  p {
    pointer-events: none;
  }
}
</style>
