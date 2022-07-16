'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "30de064987c80aa89e2b19c99d5c44a2",
"assets/assets/img/scoped_model.jpg": "230847b7dfc41fb634b62530a69eb14e",
"assets/assets/img/inherited_widget.jpg": "5abd934855f62e4bb45c1dabfe9b9640",
"assets/assets/img/redux.jpg": "4160b40379d744a0a5509361207a1db5",
"assets/assets/img/mobx.jpg": "4f06ba47e25c1d8e45a3801699a9d2c0",
"assets/assets/img/inherited_model.jpg": "cbf31266f689ee81e9843d72933683b5",
"assets/assets/img/rxdart.jpg": "5638bff2054687b4f6738f9953f3a7e6",
"assets/assets/img/bloc.jpg": "70ca803a19d0fa9629ee5cef3950073a",
"assets/assets/img/provider.jpg": "9b486a354fd27fe0bbcf3c6e4e6b4f86",
"assets/assets/img/get.jpg": "9c74c6f24d2ff8d0109d621604ea571b",
"assets/assets/img/hook_use_state.jpg": "f97c52f98938a67b8662b9003d1a1467",
"assets/assets/img/get_it.jpg": "1320873dfe4e198c97493c0fd74f5532",
"assets/assets/img/async_redux.jpg": "5cf359f6702d2a3778ee6462f24bd397",
"assets/assets/img/riverpod_hook.jpg": "9512b94a2474b026285a8c480d317960",
"assets/assets/img/set_state.jpg": "8bdfee09308ccf44bcdb90924995361a",
"assets/assets/img/riverpod.jpg": "7caf7db130df72ca8c9ffbfccc922e1f",
"assets/assets/img/binder.jpg": "453b7164bc77ae23cba17e8feecb05e8",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/NOTICES": "85b6f14e54f1869156f9446742395664",
"assets/AssetManifest.json": "4a98d1752331d8ba56be9eeb171b5408",
"assets/FontManifest.json": "878b1f0fdd8999f45ffe13dbfbcb6cf7",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/lib/src/inherited_model.dart": "55179c6ea11fee564a1bb9d85d7b7082",
"assets/lib/src/async_redux.dart": "0c5c66bc700d65708b8f38c189189777",
"assets/lib/src/riverpod.dart": "cb2642b2a5e4f26308d0286691c8e6eb",
"assets/lib/src/setstate.dart": "a74246ef9255ec6a76c9eb60fc40d376",
"assets/lib/src/hooks/state.dart": "1842f5850f03b67a1a35ade5d8f7e8af",
"assets/lib/src/hooks/custom.dart": "f66bad327b5fff5ee7c48be39cc7fb45",
"assets/lib/src/hooks/stream.dart": "ee5bef73f55573ec8b34d1bd1f6bac04",
"assets/lib/src/hooks/effect.dart": "8ed4ea6efd9c9c2b7af1abac3654f0df",
"assets/lib/src/hooks/effect_builder.dart": "c8d4dc2686e30b7091cfe1bf066bca2e",
"assets/lib/src/hooks/reducer.dart": "128489d206e7006694d391a5f9d607d4",
"assets/lib/src/hooks/riverpod_hook.dart": "5d27e7e0c245698099a523f70aedb3dc",
"assets/lib/src/bloc.dart": "999e0c251f7db7122d9ca9a09d5a7b21",
"assets/lib/src/provider.dart": "d67755805f787fa16a8ce06857a78ca0",
"assets/lib/src/redux.dart": "7a901aa68dbdec862251402216c4aec7",
"assets/lib/src/rxdart.dart": "b02234b45c6d1ec9ebc9471e3c43b32b",
"assets/lib/src/binder.dart": "96f0d410701570fbd243f368fa1bb968",
"assets/lib/src/inherited_widget.dart": "1b3c5a4f4bc35f8a36e28a7a25d6b7a2",
"assets/lib/src/scoped_model.dart": "31f7289c6a0e3b26d0e89fe0578f0a94",
"assets/lib/src/get_it.dart": "301d747ff01d90a2a2069bde68755b26",
"assets/lib/src/get.dart": "0f48f1f82cdf711a64d23fda78e8eb34",
"assets/lib/src/mobx.dart": "3776aff66dce1383c20eefcdcf835e31",
"statesman.png": "6555e2ebdcb11af8ed086065cbc32fcc",
"version.json": "2e52f579901ae5992a5f67a20a69a4d9",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"index.html": "88dad723b352a92ee89d7c1d2d7747ce",
"/": "88dad723b352a92ee89d7c1d2d7747ce",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "c4fe084b432859f0bb3a48d5b276424b"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
