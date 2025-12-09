'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0a9a0a1fa3cb7f7616b5747a9f70ec15",
"assets/AssetManifest.bin.json": "ec0df573eb8652a13645718b3b7a467d",
"assets/assets/bio_info/bio.txt": "e37ced950a1872a0015af54141b1cccb",
"assets/assets/images/headshot.jpg": "b945b9abc1e12f67e0c9e4960672f8f5",
"assets/assets/images/stonks.jpg": "1d8347a2508aadfb72fb24cc8b015f38",
"assets/assets/project_info/ai_image.json": "a39635a87668fac3e47689dfdfd628de",
"assets/assets/project_info/blank.json": "f1baf1fdf40607bb60c279f7147f1fee",
"assets/assets/project_info/colorsort.json": "f1baf1fdf40607bb60c279f7147f1fee",
"assets/assets/project_info/sentiment.json": "f1baf1fdf40607bb60c279f7147f1fee",
"assets/assets/project_info/shell.json": "61c837dd7b3345d493dc109c2c6d2c6b",
"assets/assets/project_info/shoppy.json": "6e03f2f717ee87356d511916aa68ebbe",
"assets/assets/project_info/tornado.json": "82900e8071affd03b199f816805ba93e",
"assets/assets/textures/arches.png": "ab1bfaf9d4f277493fcddf9ac945f62a",
"assets/assets/textures/axiom-pattern.png": "065da7e87fa07ac453eeb3f77835a4bf",
"assets/assets/textures/az-subtle.png": "e2ff3b6ec048b38c694165b9a2c5ab9b",
"assets/assets/textures/blizzard.png": "bec708d2fb5271ca2d6daf36687b1dc9",
"assets/assets/textures/climpek.png": "38428521d6167b96fad6a7a08303ee43",
"assets/assets/textures/cubes.png": "3c6467278a66af3216348e8588a69062",
"assets/assets/textures/diagonal-striped-brick.png": "95e70d1546db276216666a94e1c41636",
"assets/assets/textures/diagonales-decalees.png": "de6f7b8644168bbecf7494955224a00e",
"assets/assets/textures/ecailles.png": "8a42b0c6c2d2962ee30cf6c098ca42d8",
"assets/assets/textures/escheresque.png": "7dfec971292e8137f303d418efa37349",
"assets/assets/textures/fancy-deboss.png": "4f34991f6afde7508d1fe8cb1d463937",
"assets/assets/textures/farmer.png": "eb510415ee4dbe2e25b7677f9014c5b6",
"assets/assets/textures/first-aid-kit.png": "d1383f40d20ff35234fcf7c7867b4487",
"assets/assets/textures/flowers%2520(1).png": "1d37222ede63a69083d2a152e44cda63",
"assets/assets/textures/flowers.png": "1d37222ede63a69083d2a152e44cda63",
"assets/assets/textures/gplay.png": "d1b4cc17fbb3149178c9a1a6a47e33fb",
"assets/assets/textures/graphy-dark%2520(1).png": "119ae84e2d9fc8185a2a5de64a1bb90b",
"assets/assets/textures/graphy-dark.png": "119ae84e2d9fc8185a2a5de64a1bb90b",
"assets/assets/textures/graphy.png": "c220410ec0fcf9a8a903bd9d2ecd92c7",
"assets/assets/textures/grey-sandbag.png": "55229fd6c88b382054b7db49f36f2b86",
"assets/assets/textures/grid-me.png": "fcbf7c37d0209ba46dda7706d536121f",
"assets/assets/textures/knitted-sweater.png": "860c08e6f5c7149ba3d9c34e18233874",
"assets/assets/textures/little-triangles.png": "84338a5bfc4443df1ef8af744b0582e7",
"assets/assets/textures/maze-black.png": "af7695addf19516d93e5309801769ced",
"assets/assets/textures/maze-white.png": "2e73f59cc2812908a6269a6a1130a6de",
"assets/assets/textures/mbossed.png": "be1f4fdf0748b025075b31ad37187ffe",
"assets/assets/textures/my-little-plaid.png": "1b89e24c30637b30816504d64dd98d24",
"assets/assets/textures/nasty-fabric.png": "b366d2121644a5c97833c734d65f3f8f",
"assets/assets/textures/noisy-grid.png": "dccd55bd3259a74cfbe6b4e630ad7d44",
"assets/assets/textures/old-mathematics.png": "725838c1f7cc6e08384332cbf1bb62f0",
"assets/assets/textures/old-moon.png": "da6c7ff3f59747414ac4d3de5eec166d",
"assets/assets/textures/p1.png": "79890a5319d72be45124b19b5c3ddcd4",
"assets/assets/textures/p6.png": "4b3c23d19fca9d2c317d0288bbfcb208",
"assets/assets/textures/padded-light.png": "70cda1e0ad16a50db275a26ca5011eae",
"assets/assets/textures/pineapple-cut.png": "38a7417e369eb45727f0d4ce90090138",
"assets/assets/textures/pinstripe-light.png": "62317463b8d24a437c141b3a6771cf93",
"assets/assets/textures/random-grey-variations.png": "2407bb0262690da745f2d9f8b7c277ea",
"assets/assets/textures/skulls.png": "1864012b73643e9d1f21b145392b9e67",
"assets/assets/textures/vintage-speckles.png": "e0f4cccc2aacf17ec0461d94e17cc008",
"assets/assets/textures/washi.png": "ead86e32990d1819b871fbbded89084b",
"assets/assets/textures/white-sand.png": "9a01202b60c98b109d596380fdd1943d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "0aab93631551ea41685c6c1dd73f0395",
"assets/NOTICES": "7fdb05a81ee6c640b31097797451c59c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "e63793fada440c2bc845fcf53f6d6e3a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f5fd0d37368f93a3ed20e8755e1539a5",
"/": "f5fd0d37368f93a3ed20e8755e1539a5",
"main.dart.js": "0d92c01ed8b0921b299315cb025601a7",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"projects/color_sort/export_presets.cfg": "5c2e55a8152d5cb2290a2d4a679d7fd9",
"projects/color_sort/index.html": "4bbb904ab8c5d46c5ecfc9dd730d8a51",
"projects/color_sort/indexhtml.apple-touch-icon.png": "6371972a7a48c50be52fc040d9016e18",
"projects/color_sort/indexhtml.apple-touch-icon.png.import": "bd240f0ca3e8a4410ebc7171996b332b",
"projects/color_sort/indexhtml.audio.position.worklet.js": "d8e39c0bcb94439bf5b834587bd34599",
"projects/color_sort/indexhtml.audio.worklet.js": "cd716d7a3d02fd3331b475725a767c26",
"projects/color_sort/indexhtml.icon.png": "d4adc75e60cd955ade02eb902ced78e6",
"projects/color_sort/indexhtml.icon.png.import": "9e732b289d4914a7f01210780e0a3940",
"projects/color_sort/indexhtml.js": "d634baddd869bab5ada5cc1a1b791730",
"projects/color_sort/indexhtml.pck": "70e2f1b994fe1e81b7aa4eb1c61cb8e4",
"projects/color_sort/indexhtml.png": "7e41bf3051b18e392a4bb6c0cc45cd7c",
"projects/color_sort/indexhtml.png.import": "dca6b060e20c6247ab69e3212c400b85",
"projects/color_sort/indexhtml.wasm": "2e5a220c98916df47f87a75a1415ae1c",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
