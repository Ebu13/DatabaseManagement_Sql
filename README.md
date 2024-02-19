# DatabaseManagement_Sql

Veritabanı yönetim sistemleri ile verileri yönetirken bir yandan da öğrendiğim sql sorguları ve shell komutlarını içerir.

Veritabanları, çeşitli veri depolama ve yönetim yöntemlerine dayanarak farklı türlerde sınıflandırılabilir. İşte yaygın olarak kullanılan veritabanı türlerinin bir listesi:

1. **İlişkisel Veritabanları** Verilerin tablolar halinde organize edildiği ve tablolar arasında ilişkilerin tanımlandığı veritabanlarıdır. SQL (Structured Query Language) genellikle ilişkisel veritabanlarına erişmek ve sorgulamak için kullanılır.

2. **Belge Tabanlı Veritabanları** Verilerin JSON veya XML gibi belge formatlarında depolandığı veritabanlarıdır. Her belge, kendi içinde farklı alanları içerebilir ve ilişkisel veritabanlarından farklı bir modeli temsil eder. MongoDB gibi NoSQL veritabanları belge tabanlı veritabanlarına örnektir.

3. **Anahtar-Değer (Key-Value Stores)** Basit bir anahtar-değer çiftleri koleksiyonu olarak verileri depolayan veritabanlarıdır. Her veri parçası bir anahtarla ilişkilendirilir ve bu anahtarla veriye erişilir. Redis ve Memcached gibi hafıza tabanlı veritabanları anahtar-değer mağazalarına örnektir.

4. **Sütun Tabanlı Veritabanları** Verilerin sütunlar halinde depolandığı ve sorgulanabildiği veritabanlarıdır. Bu tür veritabanları, analitik sorgular için genellikle daha verimli olabilir. Apache Cassandra ve HBase gibi dağıtılmış veritabanları sütun tabanlı veritabanlarına örnektir.

5. **Graf Tabanlı Veritabanları** Verilerin graf (node ve edge'lerden oluşan yapılarda) şeklinde depolandığı ve sorgulandığı veritabanlarıdır. Bu tür veritabanları, ilişkileri ve bağlantıları analiz etmek için kullanılır. Neo4j gibi graf tabanlı veritabanı yönetim sistemleri graf tabanlı veritabanlarına örnektir.

6. **Zaman Serisi Veritabanları** Zaman serisi verilerinin depolanması ve sorgulanmasına odaklanmış veritabanlarıdır. Bu tür veritabanları, zamanla değişen verileri analiz etmek için kullanılır. InfluxDB ve Prometheus gibi zaman serisi veritabanları zaman serisi veritabanlarına örnektir.

Her veritabanı türü belirli kullanım senaryolarına ve veri depolama gereksinimlerine yönelik farklı avantajlar sağlar. Bu sınıflandırma, veritabanlarını genel olarak tanımlamak için kullanılır, ancak bazı veritabanları birden fazla kategoride de yer alabilir. Örneğin, PostgreSQL hem ilişkisel veritabanı hem de belge tabanlı veritabanı olarak kullanılabilir.