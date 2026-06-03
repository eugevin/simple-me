<script setup lang="ts">
const currentYear = new Date().getFullYear()
</script>

<template>
  <footer class="footer">
    <p>
      <span>
        Copyright © 2024 - {{ currentYear }}.
      </span>
      <span>
        Code by Eugene Vinokurov | Design by Katherine Vinokurova
      </span>
    </p>
  </footer>
</template>

<style scoped lang="scss">
.footer {
  padding: 5rem 0 1rem;
  text-align: center;

  p {
    font-size: 0.4rem;
    line-height: 1;
    display: flex;
    flex-direction: column;
    gap: .25rem;
  }
}
</style>
