<script setup lang="ts">
const props = defineProps<{
  type?: 'button' | 'link'
  to?: string
  target?: '_blank'
}>()

const componentTag = computed(() =>
  props.type === 'link' ? resolveComponent('NuxtLink') : 'button',
)

const componentProps = computed(() => {
  if (props.type === 'link') {
    return { to: props.to, target: props.target }
  }

  return { type: 'button' }
})
</script>

<template>
  <component
    :is="componentTag"
    v-bind="componentProps"
    class="button"
  >
    <slot />
  </component>
</template>

<style scoped lang="scss">
.button {
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
  text-align: center;
  line-height: 1.2;

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
