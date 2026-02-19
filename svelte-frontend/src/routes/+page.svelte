<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>

<script>
  import { onMount } from "svelte";

  let creators = [];

  onMount(async () => {
    const res = await fetch("http://localhost:4567/api/creators"); // your Sinatra API
    creators = await res.json();
  });
</script>

<h1>Creators</h1>

<ul>
  {#each creators as creator}
    <li>
      <strong>{creator.name}</strong> — {creator.about_me}
    </li>
  {/each}
</ul>


<h1>Backend test</h1>

{#if data}
  <pre>{JSON.stringify(data, null, 2)}</pre>
{/if}
