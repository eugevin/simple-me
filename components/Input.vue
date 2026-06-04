<script setup lang="ts">
defineProps<{
  type?: 'button'
}>()
</script>

<template>
  <button v-if="type === 'button'">
    <slot />
  </button>
  <input
    v-else
    type="text"
  >
</template>

<style scoped lang="scss">
button {
  outline: none;
  background: none;
  font-family: Poppins, Helvetica, sans-serif;
  font-size: 1.5rem;
  border: none;
  display: inline-block;
  color: var(--white);
  cursor: pointer;
  padding: .25rem 1rem;
  position: relative;

  &::before {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    height: .1rem;
    width: 100%;
    opacity: 0;
    mix-blend-mode: difference;
    background: var(--white);
    transition: var(--transition);
  }

  &:hover::before {
    height: 100%;
    opacity: 1;
  }
}
</style>
