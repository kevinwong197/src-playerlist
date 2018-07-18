<template>
  <!-- Do not forget to add the dependency with npm install simplebar --save -->
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
