import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  root: './',
  build: {
    rollupOptions: {
      external: ['axios']
    }
  },
  server: {
    port: 3000,
    open: true,
  }
});