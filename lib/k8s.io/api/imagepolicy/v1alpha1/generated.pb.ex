defmodule K8s.Io.Api.Imagepolicy.V1alpha1.ImageReview do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewSpec.t() | nil,
          status: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewStatus
end

defmodule K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewContainerSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          image: String.t()
        }
  defstruct [:image]

  field :image, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          containers: [K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewContainerSpec.t()],
          annotations: %{String.t() => String.t()},
          namespace: String.t()
        }
  defstruct [:containers, :annotations, :namespace]

  field :containers, 1,
    repeated: true,
    type: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewContainerSpec

  field :annotations, 2,
    repeated: true,
    type: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewSpec.AnnotationsEntry,
    map: true

  field :namespace, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewSpec.AnnotationsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          allowed: boolean,
          reason: String.t(),
          auditAnnotations: %{String.t() => String.t()}
        }
  defstruct [:allowed, :reason, :auditAnnotations]

  field :allowed, 1, optional: true, type: :bool
  field :reason, 2, optional: true, type: :string

  field :auditAnnotations, 3,
    repeated: true,
    type: K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewStatus.AuditAnnotationsEntry,
    map: true
end

defmodule K8s.Io.Api.Imagepolicy.V1alpha1.ImageReviewStatus.AuditAnnotationsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end
