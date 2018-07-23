<template>
  <div data-simplebar class="px-0">
    <div className="simplebar-scroll-content">
      <div className="simplebar-content">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script>
import 'simplebar';
import 'simplebar/dist/simplebar.css';

export default {
}
</script>
