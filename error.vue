<script setup lang="ts">
import type { NuxtError } from '#app'

const props = defineProps({
  error: Object as () => NuxtError,
})

const statusMessage = computed<string>(() => 'status ' + props.error?.status)
</script>

<template>
  <div class="error">
    <div class="container">
      <h1>{{ statusMessage }}</h1>
      <Button
        type="link"
        to="/"
      >
        Go to home ->
      </Button>
    </div>
  </div>
</template>

<style scoped lang="scss">
.error {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;

  h1 {
    margin-bottom: 1rem;
  }
}
</style>
