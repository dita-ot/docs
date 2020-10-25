# Store API

Originally DITA-OT assumed all input and output resources were on local disk and addressable with a file path. At some point, support for URI input was added, so HTTPS resources could be used as input. Both temporary and output resources were still file-based. DITA-OT 3.6 introduces a new Store API with preview support for in-memory processing.

The Store API (`org.dita.dost.store.Store`) is a Java abstraction over temporary file operations. So for example instead of reading resources directly with `FileInputStream`, the Store API provides operations for this. This abstraction allows implementations of the Store API to choose how they handle resources, enables optimizations or non–file-based storage. Since DITA-OT processes a lot of XML data, the Store API offers operations for XML processing directly. For example, a read method to directly get a DOM `Document`, instead of opening a file stream manually, parsing it with an XML parser, and getting the `Document` instance from the parser.

The Store API is extendable using Java's [Resource Loader](https://docs.oracle.com/javase/9/docs/api/java/util/ServiceLoader.html) with the `org.dita.dost.store.StoreBuilder` service. This is a builder interface to get named `Store` instances ("a Store").

## Stream Store

This Store could also be a File Store, since it uses disk and local files for temporary resources. This is the traditional DITA-OT implementation, where temporary XML files are stored under the `dita.temp.dir` path.

The Stream Store can be activated with the `store-type=file` property (added and enabled by default in DITA-OT 3.6).

## Cache Store

This Store is an in-memory Store, that keeps all temporary resources in memory. The name comes from the feature of the Store, that it caches the parsed XML after reading. That is, instead of storing XML as a byte array, it keeps it as a DOM `Document` or S9api `XdmNode`. When the same resource is read again, it doesn't have to parse it again, only return the parsed document. Resources that are not available in the temporary directory are handled with the Stream Store.

Note that while the Store doesn't write anything to the temporary directory, it will still use URIs where the resources are under the temporary directory. The URIs are simply used for addressing, similarly to URNs. Future releases of DITA-OT may use some other method of addressing, such as a `tmp` URI scheme.

As of DITA-OT 3.6, the Cache Store can be activated by setting the `store-type` property to `memory`.

The DITA-OT 3.6 implementation of the Cache Store is provided as a preview to allow integration partners to test this new feature. Not all custom plug-ins will work with the Store, because they may assume files are used and expect direct file access for resource operations.
