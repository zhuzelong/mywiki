# Corpora and vector space

## String to corpora (sparse vectors)

### Preprocessing

> The ways to process documents are so varied and application- and language-dependent that I decided to not constrain them by any interface. Instead, a document is represented by the features extracted from it, not by its “surface” string form: how you get to the features is up to you.

i.e. no API to transform string to copora


### Dictionary

`gensim.corpora.dictionary.Dictionary` is a mapping of vocabulary to integer id.

```python

# Construct a dictionary
dictionary = corpora.Dictionary(texts)  # texts is an iterable of documents
dictionary = corpora.Dictionary(line.lower().split() for line in open('docs.txt')
dictionary.save('/path/to/save')
dicionary = corpora.Dictionary.load('/path/to/save')
print dictionary.token2id

# Convert tokenized documents to sparse vectors
# The word out of the dictionary is **IGNORED** in the vector.
new_doc = 'Some string here'
new_vec = dictionary.doc2bow(new_doc.lower().split())
print(new_vec)
>> [(id1, count1), (id2, count2)]

# Transform documents to corpus
corpus = [dictionary.doc2bow(text) for text in texts]

```

### Corpus stream

> Gensim only requires that a corpus must be able to return one document vector at a time.

```python
class MyCorpus(object):
    def __iter__(self):
        with open('docs.txt', 'r') as fin:
            for line in fin:
                yield dictionary.doc2bow(line.lower().split())


```


## Corpus persistency

Refer to [doc](https://radimrehurek.com/gensim/tut1.html#corpus-formats) for various persistency formats.

- `MmCorpus`
- `SvmLightCorpus`
- `BleiCorpus`
- `LowCorpus`



# Topic extraction and transformation

## Prerequisites

> Transformations always convert between two specific vector spaces. The same vector space (i.e. the same set of feature ids) must be used for training as well as for subsequent vector transformations. Failure to use the same input feature space, such as applying a different string preprocessing, using different feature ids, or using bag-of-words input vectors where TfIdf vectors are expected, will result in feature mismatch during transformation calls and consequently in either garbage output and/or runtime exceptions.


## Tfidf

```python 
from gensim import models

# Training
tfidf = models.TfidfModel(corpus)

# Convert a new document which must be in the same vector space (via dictionary.doc2bow)
new_doc = [(0, 1), (1, 1)]
print tfidf[new_doc]

# Convert the whole corpus
corpus_tfidf = tfidf[corpus]

```

> Calling `model[corpus]` only creates a wrapper around the old corpus document stream – actual conversions are done on-the-fly, during document iteration. 


## LSA/LSI (Latent semantic indexing)

```python
lsi = models.LsiModel(corpus_tfidf, id2word=dictionary, num_topics=100)
lsi.add_documents(another_corpus)
lsi.save('/path/to/save')
lsi = models.LsiModel.load('/path/to/save')

```


### LDA (Latent Dirichlet Allocation)

```python
lda = models.LdaModel(corpus, id2word=dictionary, num_topics=100, update_every=0, passes=20)


```




# Text similarity query
