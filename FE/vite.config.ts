import { defineConfig, loadEnv } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default ({ mode }: any) => {
  // 현재 파일에서 env를 로드하려면 loadEnv가 필요하다.
  // https://stackoverflow.com/questions/66389043/how-can-i-use-vite-env-variables-in-vite-config-js
  const env = loadEnv(mode, process.cwd());

  return defineConfig({
    plugins: [react()],
    server: {
      host: true,
      port: Number(env.VITE_FE_PORT) || 3001,
    },
  });
};
