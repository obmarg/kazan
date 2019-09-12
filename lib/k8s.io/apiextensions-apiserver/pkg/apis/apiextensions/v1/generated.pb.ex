defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          uid: String.t(),
          desiredAPIVersion: String.t(),
          objects: [K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t()]
        }
  defstruct [:uid, :desiredAPIVersion, :objects]

  field :uid, 1, optional: true, type: :string
  field :desiredAPIVersion, 2, optional: true, type: :string
  field :objects, 3, repeated: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          uid: String.t(),
          convertedObjects: [K8s.Io.Apimachinery.Pkg.Runtime.RawExtension.t()],
          result: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status.t() | nil
        }
  defstruct [:uid, :convertedObjects, :result]

  field :uid, 1, optional: true, type: :string
  field :convertedObjects, 2, repeated: true, type: K8s.Io.Apimachinery.Pkg.Runtime.RawExtension
  field :result, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Status
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          request:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionRequest.t() | nil,
          response:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionResponse.t() | nil
        }
  defstruct [:request, :response]

  field :request, 1,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionRequest

  field :response, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ConversionResponse
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceColumnDefinition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          type: String.t(),
          format: String.t(),
          description: String.t(),
          priority: integer,
          jsonPath: String.t()
        }
  defstruct [:name, :type, :format, :description, :priority, :jsonPath]

  field :name, 1, optional: true, type: :string
  field :type, 2, optional: true, type: :string
  field :format, 3, optional: true, type: :string
  field :description, 4, optional: true, type: :string
  field :priority, 5, optional: true, type: :int32
  field :jsonPath, 6, optional: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceConversion do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          strategy: String.t(),
          webhook:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.WebhookConversion.t() | nil
        }
  defstruct [:strategy, :webhook]

  field :strategy, 1, optional: true, type: :string

  field :webhook, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.WebhookConversion
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionSpec.t()
            | nil,
          status:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionStatus.t()
            | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta

  field :spec, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionSpec

  field :status, 3,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionStatus
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinition.t()
          ]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta

  field :items, 2,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinition
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionNames do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          plural: String.t(),
          singular: String.t(),
          shortNames: [String.t()],
          kind: String.t(),
          listKind: String.t(),
          categories: [String.t()]
        }
  defstruct [:plural, :singular, :shortNames, :kind, :listKind, :categories]

  field :plural, 1, optional: true, type: :string
  field :singular, 2, optional: true, type: :string
  field :shortNames, 3, repeated: true, type: :string
  field :kind, 4, optional: true, type: :string
  field :listKind, 5, optional: true, type: :string
  field :categories, 6, repeated: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group: String.t(),
          names:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionNames.t()
            | nil,
          scope: String.t(),
          versions: [
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionVersion.t()
          ],
          conversion:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceConversion.t()
            | nil,
          preserveUnknownFields: boolean
        }
  defstruct [:group, :names, :scope, :versions, :conversion, :preserveUnknownFields]

  field :group, 1, optional: true, type: :string

  field :names, 3,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionNames

  field :scope, 4, optional: true, type: :string

  field :versions, 7,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionVersion

  field :conversion, 9,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceConversion

  field :preserveUnknownFields, 10, optional: true, type: :bool
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          conditions: [
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionCondition.t()
          ],
          acceptedNames:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionNames.t()
            | nil,
          storedVersions: [String.t()]
        }
  defstruct [:conditions, :acceptedNames, :storedVersions]

  field :conditions, 1,
    repeated: true,
    type:
      K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionCondition

  field :acceptedNames, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionNames

  field :storedVersions, 3, repeated: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceDefinitionVersion do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          served: boolean,
          storage: boolean,
          schema:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceValidation.t()
            | nil,
          subresources:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresources.t()
            | nil,
          additionalPrinterColumns: [
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceColumnDefinition.t()
          ]
        }
  defstruct [:name, :served, :storage, :schema, :subresources, :additionalPrinterColumns]

  field :name, 1, optional: true, type: :string
  field :served, 2, optional: true, type: :bool
  field :storage, 3, optional: true, type: :bool

  field :schema, 4,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceValidation

  field :subresources, 5,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresources

  field :additionalPrinterColumns, 6,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceColumnDefinition
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresourceScale do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          specReplicasPath: String.t(),
          statusReplicasPath: String.t(),
          labelSelectorPath: String.t()
        }
  defstruct [:specReplicasPath, :statusReplicasPath, :labelSelectorPath]

  field :specReplicasPath, 1, optional: true, type: :string
  field :statusReplicasPath, 2, optional: true, type: :string
  field :labelSelectorPath, 3, optional: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresourceStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresources do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          status:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresourceStatus.t()
            | nil,
          scale:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresourceScale.t()
            | nil
        }
  defstruct [:status, :scale]

  field :status, 1,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresourceStatus

  field :scale, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceSubresourceScale
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.CustomResourceValidation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          openAPIV3Schema:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
        }
  defstruct [:openAPIV3Schema]

  field :openAPIV3Schema, 1,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ExternalDocumentation do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          description: String.t(),
          url: String.t()
        }
  defstruct [:description, :url]

  field :description, 1, optional: true, type: :string
  field :url, 2, optional: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          raw: binary
        }
  defstruct [:raw]

  field :raw, 1, optional: true, type: :bytes
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          id: String.t(),
          schema: String.t(),
          ref: String.t(),
          description: String.t(),
          type: String.t(),
          format: String.t(),
          title: String.t(),
          default: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON.t() | nil,
          maximum: float | :infinity | :negative_infinity | :nan,
          exclusiveMaximum: boolean,
          minimum: float | :infinity | :negative_infinity | :nan,
          exclusiveMinimum: boolean,
          maxLength: integer,
          minLength: integer,
          pattern: String.t(),
          maxItems: integer,
          minItems: integer,
          uniqueItems: boolean,
          multipleOf: float | :infinity | :negative_infinity | :nan,
          enum: [K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON.t()],
          maxProperties: integer,
          minProperties: integer,
          required: [String.t()],
          items:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrArray.t()
            | nil,
          allOf: [K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t()],
          oneOf: [K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t()],
          anyOf: [K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t()],
          not: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil,
          properties: %{
            String.t() =>
              K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
          },
          additionalProperties:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrBool.t()
            | nil,
          patternProperties: %{
            String.t() =>
              K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
          },
          dependencies: %{
            String.t() =>
              K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrStringArray.t()
              | nil
          },
          additionalItems:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrBool.t()
            | nil,
          definitions: %{
            String.t() =>
              K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
          },
          externalDocs:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ExternalDocumentation.t()
            | nil,
          example: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON.t() | nil,
          nullable: boolean,
          xKubernetesPreserveUnknownFields: boolean,
          xKubernetesEmbeddedResource: boolean,
          xKubernetesIntOrString: boolean,
          xKubernetesListMapKeys: [String.t()],
          xKubernetesListType: String.t()
        }
  defstruct [
    :id,
    :schema,
    :ref,
    :description,
    :type,
    :format,
    :title,
    :default,
    :maximum,
    :exclusiveMaximum,
    :minimum,
    :exclusiveMinimum,
    :maxLength,
    :minLength,
    :pattern,
    :maxItems,
    :minItems,
    :uniqueItems,
    :multipleOf,
    :enum,
    :maxProperties,
    :minProperties,
    :required,
    :items,
    :allOf,
    :oneOf,
    :anyOf,
    :not,
    :properties,
    :additionalProperties,
    :patternProperties,
    :dependencies,
    :additionalItems,
    :definitions,
    :externalDocs,
    :example,
    :nullable,
    :xKubernetesPreserveUnknownFields,
    :xKubernetesEmbeddedResource,
    :xKubernetesIntOrString,
    :xKubernetesListMapKeys,
    :xKubernetesListType
  ]

  field :id, 1, optional: true, type: :string
  field :schema, 2, optional: true, type: :string
  field :ref, 3, optional: true, type: :string
  field :description, 4, optional: true, type: :string
  field :type, 5, optional: true, type: :string
  field :format, 6, optional: true, type: :string
  field :title, 7, optional: true, type: :string

  field :default, 8,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON

  field :maximum, 9, optional: true, type: :double
  field :exclusiveMaximum, 10, optional: true, type: :bool
  field :minimum, 11, optional: true, type: :double
  field :exclusiveMinimum, 12, optional: true, type: :bool
  field :maxLength, 13, optional: true, type: :int64
  field :minLength, 14, optional: true, type: :int64
  field :pattern, 15, optional: true, type: :string
  field :maxItems, 16, optional: true, type: :int64
  field :minItems, 17, optional: true, type: :int64
  field :uniqueItems, 18, optional: true, type: :bool
  field :multipleOf, 19, optional: true, type: :double

  field :enum, 20,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON

  field :maxProperties, 21, optional: true, type: :int64
  field :minProperties, 22, optional: true, type: :int64
  field :required, 23, repeated: true, type: :string

  field :items, 24,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrArray

  field :allOf, 25,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps

  field :oneOf, 26,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps

  field :anyOf, 27,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps

  field :not, 28,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps

  field :properties, 29,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.PropertiesEntry,
    map: true

  field :additionalProperties, 30,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrBool

  field :patternProperties, 31,
    repeated: true,
    type:
      K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.PatternPropertiesEntry,
    map: true

  field :dependencies, 32,
    repeated: true,
    type:
      K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.DependenciesEntry,
    map: true

  field :additionalItems, 33,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrBool

  field :definitions, 34,
    repeated: true,
    type:
      K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.DefinitionsEntry,
    map: true

  field :externalDocs, 35,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ExternalDocumentation

  field :example, 36,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSON

  field :nullable, 37, optional: true, type: :bool
  field :xKubernetesPreserveUnknownFields, 38, optional: true, type: :bool
  field :xKubernetesEmbeddedResource, 39, optional: true, type: :bool
  field :xKubernetesIntOrString, 40, optional: true, type: :bool
  field :xKubernetesListMapKeys, 41, repeated: true, type: :string
  field :xKubernetesListType, 42, optional: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.PropertiesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string

  field :value, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.PatternPropertiesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string

  field :value, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.DependenciesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrStringArray.t()
            | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string

  field :value, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrStringArray
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.DefinitionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string

  field :value, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrArray do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          schema:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil,
          jSONSchemas: [
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t()
          ]
        }
  defstruct [:schema, :jSONSchemas]

  field :schema, 1,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps

  field :jSONSchemas, 2,
    repeated: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrBool do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          allows: boolean,
          schema:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil
        }
  defstruct [:allows, :schema]

  field :allows, 1, optional: true, type: :bool

  field :schema, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaPropsOrStringArray do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          schema:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps.t() | nil,
          property: [String.t()]
        }
  defstruct [:schema, :property]

  field :schema, 1,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.JSONSchemaProps

  field :property, 2, repeated: true, type: :string
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ServiceReference do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          namespace: String.t(),
          name: String.t(),
          path: String.t(),
          port: integer
        }
  defstruct [:namespace, :name, :path, :port]

  field :namespace, 1, optional: true, type: :string
  field :name, 2, optional: true, type: :string
  field :path, 3, optional: true, type: :string
  field :port, 4, optional: true, type: :int32
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.WebhookClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          url: String.t(),
          service:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ServiceReference.t() | nil,
          caBundle: binary
        }
  defstruct [:url, :service, :caBundle]

  field :url, 3, optional: true, type: :string

  field :service, 1,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.ServiceReference

  field :caBundle, 2, optional: true, type: :bytes
end

defmodule K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.WebhookConversion do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          clientConfig:
            K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.WebhookClientConfig.t() | nil,
          conversionReviewVersions: [String.t()]
        }
  defstruct [:clientConfig, :conversionReviewVersions]

  field :clientConfig, 2,
    optional: true,
    type: K8s.Io.ApiextensionsApiserver.Pkg.Apis.Apiextensions.V1.WebhookClientConfig

  field :conversionReviewVersions, 3, repeated: true, type: :string
end
